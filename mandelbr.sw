
#define ColorSize 16

int colormap[16]

form start ()
int stopp
    layout "Mandelbrot" x2 = 300 y2 = 200 sysmenu
 q




         

                                                                













                                                                            q
end
pre
    int i
  
    for ( i = 0; i < ColorSize; ++i)
        colormap[i] = FromWaveLength(380.0 + (i * 400.0 / ColorSize));
    end
end

field
    paint ( cre cr )
        int i, j;
        float x, x1, y0, x0, dx, dy, xx
        float y
        int iter

        dx = 2.47 / cr.xx
        dy = 2.24 / cr.yy

        y0 = -1.12
        for ( i = 0; i < cr.yy; i++) 
            y0 += dy
       
            x0 = -2.0
            for ( j=0; j < cr.xx; j++)  
                x0 += dx

                iter = 0
                x = 0.0
                y = 0.0
                while ( x*x+y*y < 4 && iter < ColorSize )
                    xx = x*x - y*y + x0
                    y = 2*x*y + y0
                    x = xx
                    iter ++
                wend

                if (iter == ColorSize)
                    pixel ( j, i, color.blue )
                else  
                    pixel ( j, i, colormap [iter] )
                end
            end
        end
    end
end

func FromWaveLength (double wave)

    double r
    double g
    double b

    fuzzy ( wave )
        level 380.0
            r = -1.0 * (wave - 440.0) / (440.0 - 380.0)
            b = 1.0;
            break
        level 440.0
            g = (wave - 440.0) / (490.0 - 440.0);
            b = 1.0;
            break
        level 490.0
            g = 1.0;
            b = -1.0 * (wave - 510.0) / (510.0 - 490.0);
            break
        level 510.0 
            r = (wave - 510.0) / (580.0 - 510.0);
            g = 1.0;
            break
        level 580.0 
            r = 1.0;
            g = -1.0 * (wave - 645.0) / (645.0 - 580.0);
            break
        level 645.0
            r = 1.0;
    end

    double s = 1.0;
    if ( wave > 700.0)
        s = 0.3 + 0.7 * (780.0 - wave) / (780.0 - 700.0);
    else 
        if (wave <  420.0)
            s = 0.3 + 0.7 * (wave - 380.0) / (420.0 - 380.0);
        end
    end
    r = pow(r * s, 0.8);
    g = pow(g * s, 0.8);
    b = pow(b * s, 0.8);

    return rgb ( r * 255,  g * 255, b * 255 );
end


