      subroutine fluxke(x   , v   , t   , snnu)
c
c----------------------------------------------------------------------------
c
c  subroutine for program conman for time series information, this routine
c  calculates the kinetic energy and flux out the top and bottom of the box
c  at every timestep using the pressure smoothing techneque.  
c  pmass is the same as tmass.
c
c----------------------------------------------------------------------------
c
c
      implicit double precision (a-h,o-z)
c
c.... remove above card for single-precision operation
c
#include<common.h>
#include<fe.h>
#include<stress.h>
#include<materials.h>
c
      dimension x(2,*)     , v(2,*)      , t(*)     , snnu(*),
     &          prtary(6)  , vl(8)       , tl(4)    , rhsl(4),
     &          shdx(4,5)  , shdy(4,5)   , det(5)   
c
ccccccccc1ccccccccc2ccccccccc3ccccccccc4ccccccccc5ccccccccc6ccccccccc7cc
c
      common /temp1 / xl(2,4),evisc(5)

c
      eng=zero
      work=zero
      cwork = zero
      phib = zero
      tm = zero
      area = zero
      do 10 i=1,numnp
        snnu(i)  = zero
        pmass(i) = zero
10    continue
      do ivel = 1 , numel
        do node = 1, 4
          tl(node)   = t(ien(ivel,node)) 
          xl(1,node)   = x(1,ien(ivel,node) ) 
          xl(2,node)   = x(2,ien(ivel,node) ) 
        enddo
        call genshg(shdx, shdy, det, xl, ivel)
        volume=det(1)+det(2)+det(3)+det(4)
        tme=zero
        areae=zero
        do intp = 1, 4
          tme = tme 
     &        + (shl(1,intp)*tl(1) + shl(2,intp)*tl(2)
     &        +  shl(3,intp)*tl(3) + shl(4,intp)*tl(4))*det(intp)
          areae = areae + det(intp)
        enddo
        area = area + areae/volume
        tm = tm + tme/volume
      enddo
      tm = tm/area
c
c
c
      do 1000 ivel = 1 , numel
c
c..... localize coordinates, temperature and  velocity
c
        do node = 1, 4
          vl(2*node-1) = v(1,ien(ivel,node) ) 
          vl(2*node  ) = v(2,ien(ivel,node) ) 
          xl(1,node)   = x(1,ien(ivel,node) ) 
          xl(2,node)   = x(2,ien(ivel,node) ) 
          tl(node)   = t(ien(ivel,node)) 
        enddo
        eeng= vl(1)**2 + vl(2)**2 + vl(3)**2 + vl(4)**2
     &      + vl(5)**2 + vl(6)**2 + vl(7)**2 + vl(8)**2
c
c..... calculate kinetic energy and volume
c
        call rheol(x, v, t, ivel, evisc)
c
c.... call the global shape function
c
        call genshg(shdx, shdy, det, xl, ivel)
c
        volume=det(1)+det(2)+det(3)+det(4)
        flux = zero
        ework = zero
        ephib = zero
c
        do intp = 1, 4
          uxq = shdx(1,intp)*vl(1) + shdx(2,intp)*vl(3)
     &        + shdx(3,intp)*vl(5) + shdx(4,intp)*vl(7)
          uyq = shdy(1,intp)*vl(1) + shdy(2,intp)*vl(3)
     &        + shdy(3,intp)*vl(5) + shdy(4,intp)*vl(7)
          vxq = shdx(1,intp)*vl(2) + shdx(2,intp)*vl(4)
     &        + shdx(3,intp)*vl(6) + shdx(4,intp)*vl(8)
          uyq = shdy(1,intp)*vl(2) + shdy(2,intp)*vl(4)
     &        + shdy(3,intp)*vl(6) + shdy(4,intp)*vl(8)
        ework = ework + 0.5*(1.0e0*(uxq*uxq + uyq*uyq) +
     &          (uyq+vxq)*(vxq+uyq))*det(intp)*evisc(intp)
        ephib = ephib + (tm-
     &       tl(1)*shl(1,intp)+tl(2)*shl(2,intp)
     &      +tl(3)*shl(3,intp)+tl(4)*shl(4,intp))
     &     *(vl(2)*shl(1,intp)+vl(4)*shl(2,intp)
     &      +vl(6)*shl(3,intp)+vl(8)*shl(4,intp))*det(intp)
c 1/2.000 is a scaling to make Ra come out to 10^5
ccccccccc1ccccccccc2ccccccccc3ccccccccc4ccccccccc5ccccccccc6ccccccccc7cc
        enddo
        eng = eng + eeng*volume
c       work = work + 1.0e-2*ework/volume
        if (mat(ivel) .gt. 1) work = work + ework/volume
        if (mat(ivel) .gt. 1) phib = phib + ephib/volume
        if(mat(ivel).eq.2) cwork=cwork+ework/volume
c
        do intp=1, 4
          flux = flux - (shdy(1,intp)*tl(1) + shdy(2,intp)*tl(2)
     &                 + shdy(3,intp)*tl(3) + shdy(4,intp)*tl(4))
     &          *det(intp)
c
          flux = flux + ( shl(1,intp)*tl(1) + shl(2,intp)*tl(2)
     &                   +shl(3,intp)*tl(3) + shl(4,intp)*tl(4) )*
     &                   (shl(1,intp)*vl(2) + shl(2,intp)*vl(4) +
     &                    shl(3,intp)*vl(6) + shl(4,intp)*vl(8) )
     &                   *det(intp)
        enddo
c
        elnu = flux / volume
c
c smooth elnu (over elements) to snnu (over nodes)
c
        do node = 1, 4
c
c calculte element "weight"
c
          rhsl(node) = det(1)*shl(node,1) + det(2)*shl(node,2)
     &               + det(3)*shl(node,3) + det(4)*shl(node,4)
c
c assemble element stress contribution to the node
c
          snnu(ien(ivel,node)) = snnu(ien(ivel,node))+rhsl(node)*elnu
        enddo
c
c calculate pmass
c
        smass = rhsl(1) + rhsl(2) + rhsl(3) + rhsl(4)
c
        do node = 1 , 4
          tmass = rhsl(node) * volume / smass
          pmass(ien(ivel,node)) = pmass(ien(ivel,node))+tmass
        enddo
c
c end loop over elements
c
1000  continue
c
      do i=1, numnp
        snnu(i) = snnu(i) / pmass(i)
      enddo
c
c fix boundary
c
      do i=1,nodebn
        snnu(nb(1,i)) = two * snnu(nb(1,i)) - snnu(nb(2,i))
      enddo
c
      eng = eng * pt25 * pt25
c
c..... save output to an array to print every 100 steps
c
      xtott = 0
      xtotb = 0
      fluxt = 0
      fluxb = 0
      pvelt = 0
      pvelb = 0
c..... flux across the top
c     fac = 3.0e3 * 1300.0 / 6.0e5
      fac = 1.0
      do 1300 node=1, nodebn/2 - 1
        xtemp = x(1,nb(1,node) ) - x(1,nb(1,node+1) )
        vtemp = v(1,nb(1,node) ) + v(1,nb(1,node+1) )
        ttemp = snnu( nb(1,node) ) + snnu(  nb(1,node+1) )
        xtott = xtott + xtemp
        fluxt = fluxt + ttemp * xtemp * pt5
        pvelt = pvelb + vtemp * xtemp * pt5
1300   continue
c..... flux across the bottom
      do 1400 node=nodebn/2 + 1, nodebn -1
        xtemp = x(1,nb(1,node) ) - x(1,nb(1,node+1) )
        vtemp = v(1,nb(1,node) ) + v(1,nb(1,node+1) )
        ttemp = snnu( nb(1,node) ) + snnu( nb(1,node+1) )
        xtotb = xtotb + xtemp
        fluxb = fluxb + ttemp * xtemp * pt5
        pvelb = pvelb + vtemp * xtemp * pt5
c       write(80,*) x(1,nb(1,node)) , snnu(nb(1,node)) 
1400   continue
c      write(80,1002)(fac*snnu(nb(1,node)),node=nodebn/2+1,nodebn)
1002   format(361(1pe14.7,1x))
c
      prtary(1) = fluxt/xtott
      prtary(2) = fluxb/xtotb
      prtary(3) = eng
      prtary(4) = time
      prtary(5) = pvelt/xtott
      prtary(6) = pvelb/xtotb
      write(itsout,1001) prtary(1),prtary(2),prtary(3),
     &                   prtary(4),prtary(5),prtary(6),
     &                   cwork, work, phib, tm, work/phib
c
c..... return
c
1001    format ( 11(e15.8,1x))
1006    format ( 5x, i5, 10x, f15.8)
      return
      end
