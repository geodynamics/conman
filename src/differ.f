      program differ
c
c
c
      dimension t(101,61), t2(101,61)
      open(1,file='temp.batchFb')
      open(2,file='temp.p')
      do iy=1,61
          read(1,*) (t(ix,iy),ix=1,101)
          read(2,*) (t2(ix,iy),ix=1,101)
      enddo
      do ix=1,101
      do iy=1,61
c       x = 1.6667*(ix-1)/100.
        x = 1.6667*(ix-1)/100.
        y = 1.0*(61-iy)/60.
        write(6,*) x,y,(t(ix,iy)-t2(ix,iy))
c       write(6,*) x,y,t(102-iy,iy)/1300.0
      enddo
      enddo
 1000 format(101(1pe14.7,1x))
 1001 format(101(f11.6,1x))
      stop
      end
