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
    
    lid_thick=50;		# thickness of frozen lid on top

    slab_thick=140;		# for case D, sqrt(2)*plate thickness
    
    nelz = height/dx;		# elements in z
    nelx = width/dx;		# elements in x

    vplate = 2.1637467;		# that's how it's set in batchelor
    #v0 = vplate/sqrt(2.);	# which is 1.52999996434001, but not the v0 below?
    
    v0 =    1.538560;		# component velocity

    age_ma = plate_age * 1.e6 * 365.25*60*60*24; # age of plate in s 
    kappa = 0.7272e-6;		# diffusivity

    
    erf_scale = 2.*sqrt(kappa*age_ma)/1e3;		# error function scale in km
    
    nlid =  lid_thick/dx+1;	# nodex in lis 
    nslab = slab_thick/dx+1;	# 

    print("using: nelx ",nelx,"nelz ",nelz,"nlid ",nlid,"age ",plate_age) > "/dev/stderr";
    
    rayleigh = 0;
    heating=0;
    viscosityP=0.0;		# depth dependece
    
    ntimestep = 30;		# total timestep
    nprintstep= 30;		# output every nprintstep steps

    tmax = 0.61;			# maxium time (in diffusion time)

    if(sub_type=="A")
	dt_out = 0.6;		# for whatever reason
    else 			
	dt_out = 0.01;		# 

    

    tsave=0.6;			# time controlled output
    
    nox=nelx+1;
    noz=nelz+1;

    numnp=nox*noz;

    iflow=1;			# 1: execute
    necho=0;			# 0: terse 1: verbose

    inrstr=0;			# 0: conductive start 1: restart fro unit 16
    iorstr=1;			# 

    Tpert=0.01			# temp pert
    Tbot=1.0;			# temperature at bottom and sides
    Ttop=0.0;
    
    # number of edge nodes for nusselt smoother (top and bottom)
    nodebn=nox*2;

    if(viscosityE == 0){
	# rheology
	ntimvs=0;			# 0: const visc 3: Arrheinius 4: diff/disl
	                                # 5: Stein & Hansen 6: Frank Kaminetskii
    }else{
	ntimvs=6;
    }

    nwrap=0;			# for periodic BC

    itype=4;			# 1: ALA 2: TALA 3: EBA 4: Boussinesq approx

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
	print(nprintstep,tmax, dt_out, tsave,tsave);
#	print("velocity boundary condition flags: IFCMT,DELNXTLN")
#	print("bnode   enode   incr bcf1 bcf2")
	if(sub_type == "A"){
	    # all velocities prescribed
	    print("set every node to the Batchelor Solution");
	    print(1,numnp,1,2,2);
	}
		  
	print("frozen lid")	# top layer, all no slip
	for(i=0;i < nlid;i++)
	    print(noz-i,(nelx+1)*noz-i,noz,1,1);

	if(sub_type == "D"){
	    #
	    # NOT WORKING YET
	    #
	    # only push in slab
	    print("driven slab (only in slab)")
	    j=1;
	    for(plen=noz;plen>0;plen--){
		lower = j+plen-nslab;
		if(lower>0)
		    print(lower,j+plen-1,1,1,1);
		j+=noz;
	    }
	    print("left side below slab free");
	    print(1,noz-nslab,1,0,0);
	    print("bottom up until slab free");
	    # slab top hits bottom at node (noz-1)*noz+1
	    print(1,(noz-1-nslab)*noz+1,1,0,0);
	}else{
	    #
	    # triangular push part
	    #
	    print("driven slab (left side)")
	    j=1;
	    for(plen=noz;plen>0;plen--){
		print(j,j+plen-1,1,1,1);
		j+=noz;
	    }
	}

	
	print("bottom of the box (right side)"); 
	if((sub_type == "C")||(sub_type == "D")){
	    print(j,(nelx*noz)+1,noz,0,0);# free on bottom
	}else{
	    print(j,(nelx*noz)+1,noz,2,2); # batchelor
	}

	print("arc side boundary")
	if((sub_type == "C")||(sub_type=="D")){
	    print((nelx*noz)+1,(nelx+1)*noz-nlid,1,0,0);# free on right
	}else{
	    print((nelx*noz)+1,(nelx+1)*noz-nlid,1,2,2);# Batchelor on right
	}
	print(0,0,0,0,0);		   # end VBC

	print("fixed left hand side (plate side) temperature boundary")
	print(1,noz,1,1);
	print("fixed right hand side (arc side) temperature boundary");
	print(nelx*noz+1,(nelx+1)*noz,1,1);
	print("fixed top temperature boundary")
	print(noz,(nelx+1)*noz,noz,1);
	print(0,0,0,0)
	print(1,(nelx*noz)+1,noz); # bottom row
	print(noz,(nelx+1)*noz,noz);# top tow
	print(0,0,0,0);
	#print("bndy info (2nd from top - 2nd from bottom rows)");
	print(2,nelx*noz+2,noz);	# bottom+1
	print(noz-1,(nelx+1)*noz-1,noz);	# top-1
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
	printf("%i\t%i\t%.1f %.1f\n",1,4,0,0)	# BL
	printf("%i\t%i\t%.1f %.1f\n",nelx*noz+1,1,  width,0)	# BR
	printf("%i\t%i\t%.1f %.1f\n",(nelx+1)*noz,1,width,height)	# TR
	printf("%i\t%i\t%.1f %.1f\n",noz,1,0,height)	# TL
	# generation
	print(nox-1,noz,noz-1,1) # 
	print(0,0,0,0);

	#print("velocity boundary conditions (slab vlocity)");
	if(sub_type=="D"){
	    i=1;
	    for(plen = noz;plen > 0;plen--){
		for(j=i;j < i+plen;j++){
		    if(i+plen-j-1 < nslab)
			print(j,0,v0,-v0);
		}
		i+=noz;
	    }
	}else{
	    i=1;
	    for(plen = noz;plen > 0;plen--){
		for(j=i;j < i+plen;j++){
		    print(j,0,v0,-v0);
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
		print(nn,0,Ttop + (Tbot-Ttop)*depth/lid_thick);
	    }else{		# below
		print(nn,0,Tbot);
	    }
	}
	# left hand side, half space cooling
	for(i=noz;i>=1;i--){
	    depth=(noz-i)*dx;	# depth from top
	    printf("%i 0 %.10f\n",i,Ttop + (Tbot-Ttop)*erf(depth/erf_scale));
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
