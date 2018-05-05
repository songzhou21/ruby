require "inline"

class Object
    inline do |builder|
        builder.include "<math.h>"
        builder.c "
         int mandelbrot(double cr, double ci){
            long limit = 95;
            long iter = 0;
            double zr = 0, zi = 0,zzr, zzi;
            while (iter < limit && sqrt(zr*zr+zi*zi) < 10){
              zzr = zr*zr-zi*zi+cr;
              zzi = zr*zi+zi*zr+ci;
              zr = zzr; zi = zzi;
              iter++;
            }
            return iter;
          }"
    end
end

def mandel_calc(min_r, min_i, max_r, max_i, res)
    cur_i = min_i
    while cur_i > max_i
        print "|"
        cur_r = min_r
        while cur_r < max_r
            ch = 127 - mandelbrot(cur_r, cur_i)
            printf "%c", ch
            cur_r += res
        end
        print "|\n"
        cur_i -= res
    end
end

mandel_calc(-2, 1, 1, -1, 0.04)
