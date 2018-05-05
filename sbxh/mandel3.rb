def mandelbrot(c_r, c_i)
    limit = 95
    iterations = 0

    cr = (c_r * 100).to_i
    ci = (c_i * 100).to_i
    zr = zi = 0

    while iterations < limit and Math.sqrt(zr*zr + zi*zi) < 1000
        zr, zi = (zr*zr - zi*zi)/100 + cr, (zr*zi + zi*zr)/100 + ci
        iterations += 1
    end

    return iterations
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
