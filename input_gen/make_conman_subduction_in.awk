#
# scripts to generate input for ConMan 2020 CIG version
#
# subduction cornerflow benchmark cases from Cookbook2
#
# A: all velocities from corner flow solution
# B: velocities on right side from corner flow
# C: velocities free on side
# D: only push slab, not whole lower triangle - NOT WORKING (probably needs to be constrained more)
#
BEGIN{
    
    #
    # default parameters
    #
    if(width=="")		# width
	width=660;		# 
    if(height=="")		# height of box
	height=600;
    if(dx=="")			# resolution
	dx = 10;		#
    if(viscosityE=="")
	viscosityE=0;		# temp dependent viscosity
    # 
    if(print_geom=="")		# print
	print_geom=0;		# general input or geometry

    if(sub_type=="")
	sub_type="C";		# which benchmark type

    if(plate_age=="")		# plate age in Myr
	plate_age=50;

    if(vplate=="")		# plate velocity in cm/yr
	vplate=5;

    
    lid_thick=50;		# thickness of frozen lid on top
    

    #
    # derived parameters
    #
    nelz = int(height/dx);		# elements in z
    nelx = int(width/dx);		# elements in x

    sec_per_year = 365.25*24.*60.*60.; # seconds per year
    kappa = 0.7272e-6;		# diffusivity

    # characteristic velocity based on diffusion time
    vc = kappa/1000.;		# characteristic velocity based on conversion from km (as used input) to m

    vplate_nd = (vplate/100./sec_per_year)/vc;# this comes out to 2.178773914605951
    #vplate_nd = 2.1637467;	# that's how it was set in batchelor

    
    v0 = vplate_nd/sqrt(2.);	# componenet velocity, v_x, v_z - comes out to 1.540626
    #v0 =    1.538560;		# component velocity, slightly off in orignal test from the original vplate_nd


    age_s = plate_age * 1.e6 * sec_per_year; # age of plate in s 

    
    erf_scale = 2.*sqrt(kappa*age_s)/1e3;		# error function scale in km

    slab_thick = 1.15 * erf_scale * sqrt(2.); # TBL (2.23/2) times sqrt(2) for case D

    
    nlid =  int(lid_thick/dx+.5)+1;	# nodex in lis 
    nslab = int(slab_thick/dx+.5)+1;	# slab "depth" for case D

    
    print("using: nelx ",nelx,"nelz ",nelz,"nlid ",nlid,"age ",plate_age, "speed ",vplate) > "/dev/stderr";


    tsave=0.6;			# time controlled output
    tmax = 0.61;			# maxium time (in diffusion time)
    
    if(vplate == 5){		# default speed, no change needed 
	itype=5;			# 1: ALA 2: TALA 3: EBA 4: Boussinesq approx
	                                # 5: wedge benchmark 6: use tmovis for v_plate
	tmovis = tsave;
    }else{
	# need to change the Batchelor solution velocity 
	itype = 6;
	tmovis = vplate_nd;
    }
    
    rayleigh = 0;		# for subduction problem Ra should be zero
    heating=0;
    viscosityP=0.0;		# depth dependece
    
    ntimestep = 30;		# total timestep
    nprintstep= 30;		# output every nprintstep steps


    if(sub_type=="A")
	dt_out = 0.6;		# for whatever reason
    else 			
	dt_out = 0.01;		# 

    
    nox = nelx+1;
    noz = nelz+1;

    numnp = nox*noz;

    iflow=1;			# 1: execute
    necho=0;			# 0: terse 1: verbose

    inrstr=0;			# 0: conductive start 1: restart fro unit 16
    iorstr=1;			# 

    Tpert=0.01			# temp pert
    Tbot=1.0;			# temperature at bottom and sides
    Ttop=0.0;
    
    # number of edge nodes for nusselt smoother (top and bottom)
    nodebn = nox*2;

    if(viscosityE == 0){
	# rheology
	ntimvs=0;			# 0: const visc 3: Arrheinius 4: diff/disl
	                                # 5: Stein & Hansen 6: Frank Kaminetskii
    }else{
	ntimvs=6;
    }

    nwrap=0;			# for periodic BC


    #isolve=1;			# 1: explicit 2: implicit 3: Picard
    #isolve=2;			# 1: explicit 2: implicit 3: Picard
    isolve=3;

    numat=1;
    visc0[1]=1;penalty[1]=1e7;diff[1]=1.0;ra[1]=rayleigh;
    dmhu[1]=heating;viscE[1]=viscosityE;viscV[1]=viscosityV;
    ecut[1]=1e6;

    if(!print_geom){
	#
	# print general input file
	# 
	printf("%i by %i element subduction problem type %s\n",nelx,nelz,sub_type);
#	print("#Nds   X   Z  ck echo rrst wrst nus tdvf  wr");
	print(numnp,nelx,nelz,iflow,necho,inrstr,iorstr,nodebn,ntimvs,nwrap,itype,isolve);
#	print("time step information")
	print(ntimestep,1.0);
#	print("output information")
	print(nprintstep,tmax, dt_out, tsave,tmovis);
#	print("velocity boundary condition flags: IFCMT,DELNXTLN")
#	print("bnode   enode   incr bcf1 bcf2")
	if(sub_type == "A"){
	    # all velocities prescribed
	    print("set every node to the Batchelor Solution");
	    printf("%8i %8i %5i %2i %2i\n",1,numnp,1,2,2);
	}
		  
	print("frozen lid")	# top layer, all no slip
	for(i=0;i < nlid;i++)
	    printf("%8i %8i %5i %2i %2i\n",noz-i,(nelx+1)*noz-i,noz,1,1);

	if(sub_type == "D"){
	    #
	    #
	    # only push in slab
	    # 
	    print("driven slab (only in slab)")
	    j=1;
	    for(plen=noz;plen>0;plen--){
		lower = j+plen-nslab;
		if(lower>0)
		    printf("%8i %8i %5i %2i %2i\n",lower,j+plen-1,1,1,1);
		j+=noz;
	    }
	    printf("%8i %8i %5i %2i %2i\n",1,1,1,1,1); # pin lower left
	    print("left side below slab ");
	    #printf("%8i %8i %5i %2i %2i\n",1,noz-nslab,1,0,0);
	    printf("%8i %8i %5i %2i %2i\n",2,noz-nslab,1,0,0);
	    print("bottom up until slab");
	    # slab top hits bottom at node (noz-1)*noz+1
	    #printf("%8i %8i %5i %2i %2i\n",1,(noz-1-nslab)*noz+1,noz,0,0);
	    printf("%8i %8i %5i %2i %2i\n",noz+1,(noz-1-nslab)*noz+1,noz,0,0);
	}else{
	    #
	    # triangular push part
	    #
	    print("driven slab (left side)")
	    j=1;
	    for(plen=noz;plen>0;plen--){
		printf("%8i %8i %5i %2i %2i\n",j,j+plen-1,1,1,1);
		j+=noz;
	    }
	}

	print("bottom of the box (right side)"); 
	if((sub_type == "C")||(sub_type == "D")){
	    printf("%8i %8i %5i %2i %2i\n",j,(nelx*noz)+1,noz,0,0);# free on bottom
	}else{
	    printf("%8i %8i %5i %2i %2i\n",j,(nelx*noz)+1,noz,2,2); # batchelor
	}

	print("arc side boundary")
	if((sub_type == "C")||(sub_type=="D")){
	    printf("%8i %8i %5i %2i %2i\n",(nelx*noz)+1,(nelx+1)*noz-nlid,1,0,0);# free on right
	}else{
	    printf("%8i %8i %5i %2i %2i\n",(nelx*noz)+1,(nelx+1)*noz-nlid,1,2,2);# Batchelor on right
	}
	print(0,0,0,0,0);		   # end VBC

	print("fixed left hand side (plate side) temperature boundary")
	printf("%8i %8i %5i %2i\n",1,noz,1,1);
	print("fixed right hand side (arc side) temperature boundary");
	printf("%8i %8i %5i %2i\n",nelx*noz+1,(nelx+1)*noz,1,1);
	print("fixed top temperature boundary")
	printf("%8i %8i %5i %2i\n",noz,(nelx+1)*noz,noz,1);
	print(0,0,0,0)
	printf("%8i %8i %5i\n",1,(nelx*noz)+1,noz); # bottom row
	printf("%8i %8i %5i\n",noz,(nelx+1)*noz,noz);# top tow
	print(0,0,0,0);
	#print("bndy info (2nd from top - 2nd from bottom rows)");
	printf("%8i %8i %5i\n",2,nelx*noz+2,noz);	# bottom+1
	printf("%8i %8i %5i\n",noz-1,(nelx+1)*noz-1,noz);	# top-1
	print(0,0,0,0);
	#print("initial condition information");
	print(Tpert,width,height);
	#print("equation of state information")
	print(0.0, 273.0,  1000.0, 1.0, 1.0);


#print("element information")
	print(numat,0);
	#print("viscosity")
	for(i=1;i<=numat;i++)
	    printf("%e\n",visc0[i]);
	#print("penalty number")
	for(i=1;i<=numat;i++)
	    printf("%g\n",penalty[i]);
	#print("diffusivity (always one)")
	for(i=1;i<=numat;i++)
	    printf("%g\n",diff[i]);
	#print("Rayleigh number")
	for(i=1;i<=numat;i++)
	    printf("%g\n",ra[i]);
	#print("internal heating parameter")
	for(i=1;i<=numat;i++)
	    printf("%g\n",dmhu[i]);
	#print("activation energy")
	for(i=1;i<=numat;i++)
	    printf("%g\n",viscE[i]);

	#print("activation volume")
	for(i=1;i<=numat;i++)
	    printf("%g\n",viscV[i]);

	
    }else{
	# print geometry
        # geom
	#print("coordinates");
	printf("%8i\t%8i\t%15.4f %15.4f\n",1,4,0,0)	# BL
	printf("%8i\t%8i\t%15.4f %15.4f\n",nelx*noz+1,1,  width,0)	# BR
	printf("%8i\t%8i\t%15.4f %15.4f\n",(nelx+1)*noz,1,width,height)	# TR
	printf("%8i\t%8i\t%15.4f %15.4f\n",noz,1,0,height)	# TL
	# generation
	printf("%6i %6i %6i %6i\n",nox-1,noz,noz-1,1) # 
	print(0,0,0,0);

	#print("velocity boundary conditions (slab vlocity)");
	if(sub_type=="D"){
	    # push only in slab
	    j=1;
	    for(plen=noz;plen>0;plen--){
		lower = j+plen-nslab;
		if(lower>0){
		    for(k=lower;k<=j+plen-1;k++)
			printf("%8i %8i %20.10f %20.10f\n",k,0,v0,-v0);
		}
		j+=noz;
	    }
	}else{
	    # push lower left triangle region
	    i=1;
	    for(plen = noz;plen > 0;plen--){
		for(j=i;j < i+plen;j++){
		    printf("%8i %8i %20.10f %20.10f\n",j,0,v0,-v0);
		}
		i+=noz;
	    }
	}
	print(0,0,0,0);

	#print("temperature boundary conditions (non-zero)");
	# right hand side
	for(i=noz;i>=1;i--){
	    nn = nelx*noz+i;
	    depth=(noz-i)*dx;	# depth from top
	    if(depth <= lid_thick){ # in lid
		printf("%8i %2i %20.10f\n",nn,0,Ttop + (Tbot-Ttop)*depth/lid_thick);
	    }else{		# below
		printf("%8i %2i %20.10f\n",nn,0,Tbot);
	    }
	}
	# left hand side, half space cooling
	for(i=noz;i>=1;i--){
	    depth=(noz-i)*dx;	# depth from top
	    printf("%8i %2i %20.10f\n",i,0,Ttop + (Tbot-Ttop)*erf(depth/erf_scale));
	}

	print(0,    0, 0.0);	# should be 0,0 to end group?
	#print("element connectivity and material groups");
	print(1,1,1, 1,noz+1,noz+2,2); # lower left element, sorted CCW
	print(nelx,nelz,noz,nelz,1,1);
	print(0,      0,      0,      0,      0,      0,      0); # end

    }


    
}

function erf(x)
{
    command = ( "echo " x " | myerf" )
    command | getline ret
    return ret
}  
