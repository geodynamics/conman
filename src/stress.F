      subroutine stres( x , v, t )
c
      implicit double precision (a-h,o-z)
c
c.... remove above card for single-precision operation
c
c
#include<common.h>
#include<fe.h>
#include<stress.h>
#include<materials.h>
c
      dimension x(nsd,*) , v(ndof,*) , t(*) ,
     &         shdx(4,5) , shdy(4,5) , det(5), tl(4)
c
c
      common /temp1 /  xl(2,4), vl(8)    , strtmp(6) , rhsl(8) , 
     &                 volume , smass    , tmass(4)  , evisc(5)
c
      real*8 maxsecinv, secinv

      maxsecinv = -1.0d6
      do 50 n = 1, 6
        do 45 i = 1, numnp
          stress(n,i) = zero
45      continue
50    continue

      do 1000 ivel = 1 , numel
c
c..... localize coordinates and velocity
c
        do n=1,nen
          xl(1, n) = x(1,ien(ivel,n) ) 
          xl(2, n) = x(2,ien(ivel,n) ) 
          vl(2*n-1) = v(1,ien(ivel,n) ) 
          vl(2*n  ) = v(2,ien(ivel,n) ) 
c         xl(1, n) = x(1,ien(ivel,n) ) * 3.0e6
c         xl(2, n) = x(2,ien(ivel,n) ) * 3.0e6
c         vl(2*n-1) = v(1,ien(ivel,n) ) * 1.0e-6 / 3.0e6 
c         vl(2*n  ) = v(2,ien(ivel,n) ) * 1.0e-6 / 3.0e6
          tl(n  ) = t(ien(ivel,n) ) 
c*3.16e7/6e5
        enddo
c
c.... call the global shape function
c
        call genshg(shdx, shdy, det, xl, ivel)
c
c
c find velocity derivative at element centers
c
c  normal stress x
       strtmp(1) = 1.0*(shdx(1,5)*vl(1) + shdx(2,5)*vl(3)
     &           + shdx(3,5)*vl(5) + shdx(4,5)*vl(7))
c  normal stress y
       strtmp(2) = 1.0*(shdy(1,5)*vl(2) + shdy(2,5)*vl(4)
     &           + shdy(3,5)*vl(6) + shdy(4,5)*vl(8))
c  shear stress
       strtmp(3) = 0.5*(shdx(1,5)*vl(2) + shdx(2,5)*vl(4)
     &           + shdx(3,5)*vl(6) + shdx(4,5)*vl(8)
     &           + shdy(1,5)*vl(1) + shdy(2,5)*vl(3)
     &           + shdy(3,5)*vl(5) + shdy(4,5)*vl(7))
c pressure
       strtmp(4) = ( strtmp(1) + strtmp(2) )
c second invariant
       strtmp(5) = abs( strtmp(2)*strtmp(2)
     &             + strtmp(1)*strtmp(1)
     &             + strtmp(3)*strtmp(3) )

c
c..... scale by material parameters use last time steps viscosity!
c
        if (strtmp(5) .gt. zero ) then
           strtmp(5) = sqrt(0.5*strtmp(5))
        endif

        if (strtmp(4) .gt. maxsecinv) then
           maxsecinv = strtmp(4)
        endif
c       strtmp(5) = strtmp(5)*1.0e21/tcon(3,mat(ivel))
        xn=3.5
c       strtmp(4) = (strtmp(5)**((1-xn)/xn))
c
c scale by material parameters
c
        call rheol ( x , v , t , ivel , evisc)
c       evisc(5) = 1.0e0
        strtmp(1) =   two        * evisc(5) * strtmp(1)
        strtmp(2) =   two        * evisc(5) * strtmp(2)
        strtmp(3) =                evisc(5) * strtmp(3)
c       strtmp(4) =-evisc(5)*alam(mat(ivel))* strtmp(4)
        strtmp(4) =-evisc(5)* strtmp(4)
        strtmp(5) = strtmp(2) - strtmp(4)
        strtmp(6) = evisc(5)
c
c calculte element "weight"
c
        rhsl(1) = det(1) * shl(1,1) + det(2) * shl(1,2)
     &          + det(3) * shl(1,3) + det(4) * shl(1,4)
c
        rhsl(2) = det(1) * shl(2,1) + det(2) * shl(2,2)
     &          + det(3) * shl(2,3) + det(4) * shl(2,4)
c
        rhsl(3) = det(1) * shl(3,1) + det(2) * shl(3,2)
     &          + det(3) * shl(3,3) + det(4) * shl(3,4)
c
        rhsl(4) = det(1) * shl(4,1) + det(2) * shl(4,2)
     &          + det(3) * shl(4,3) + det(4) * shl(4,4)
c
c assemble element stress contribution to the node
c
        do n=1,6
          rhsl(5) = rhsl(1) * strtmp(n)
          rhsl(6) = rhsl(2) * strtmp(n)
          rhsl(7) = rhsl(3) * strtmp(n)
          rhsl(8) = rhsl(4) * strtmp(n)
          stress(n,ien(ivel,1)) = stress(n,ien(ivel,1)) + rhsl(5)
          stress(n,ien(ivel,2)) = stress(n,ien(ivel,2)) + rhsl(6)
          stress(n,ien(ivel,3)) = stress(n,ien(ivel,3)) + rhsl(7)
          stress(n,ien(ivel,4)) = stress(n,ien(ivel,4)) + rhsl(8)
        enddo
c
c calculate pmass done above in fluxke left here for completeness
c
        tmass(1) = shl(1,1) * det(1) + shl(1,2) * det(2)
     &              + shl(1,3) * det(3) + shl(1,4) * det(4)
c
        tmass(2) = shl(2,1) * det(1) + shl(2,2) * det(2)
     &              + shl(2,3) * det(3) + shl(2,4) * det(4)
c
        tmass(3) = shl(3,1) * det(1) + shl(3,2) * det(2)
     &              + shl(3,3) * det(3) + shl(3,4) * det(4)
c
        tmass(4) = shl(4,1) * det(1) + shl(4,2) * det(2)
     &              + shl(4,3) * det(3) + shl(4,4) * det(4)
c
        smass=tmass(1) + tmass(2) + tmass(3) + tmass(4)
c
        volume=det(1)+det(2)+ det(3) + det(4)
c
        tmass(1) = tmass(1) * volume / smass
        tmass(2) = tmass(2) * volume / smass
        tmass(3) = tmass(3) * volume / smass
        tmass(4) = tmass(4) * volume / smass
c
        pmass( ien(ivel,1) ) = pmass( ien(ivel,1) ) + tmass(1)
        pmass( ien(ivel,2) ) = pmass( ien(ivel,2) ) + tmass(2)
        pmass( ien(ivel,3) ) = pmass( ien(ivel,3) ) + tmass(3)
        pmass( ien(ivel,4) ) = pmass( ien(ivel,4) ) + tmass(4)
c
c end loop over elements
c
1000  continue
c
c  
c
      do n=1,6
        do i=1, numnp
          stress(n,i) = stress(n,i) / pmass(i)
        enddo
      enddo
c
c fix boundary according to Hager & King correction 8/24/89
c   N.B. FIX ASSUMES CONSTANT RAYLEIGH NUMBER
C
      do n=1,6
        do i=1,nodebn
c Hughes for testing purposes
c       stress(n,nb(1,i))=two*stress(n,nb(1,i))-stress(n,nb(2,i))
c234567890123456789012345678901234567890123456789012345678901234567890
        enddo
      enddo
c
c
c
      return
      end
      subroutine prtstr(x,stress)
c
c.... program to print stress data
c
      implicit double precision (a-h,o-z)
c
c.... deactivate above card(s) for single precision operation
c
      include 'common.h'
c
      dimension x(ndof,*), stress(6,*)

c
      write(imout,1000) ndof,nelx,nelz,numnp,nstep,time
      write(imout,1500)
      do 100 n=1,numnp
      write(imout,2000) n,(x(i,n),i=1,2),(stress(j,n),j=1,6)
  100 continue
c
c
      return
c
 1000 format(5i10,f10.6)
 1500 format('  node   x1        x2           txx            tzz',
     &       '      txz         P    ')
 2000 format(1x,i7,1x,2(1pe13.7,1x),6(1pe12.5,1x))
      end
