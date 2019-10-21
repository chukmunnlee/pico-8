pico-8 cartridge // http://www.pico-8.com
version 16
__lua__

frame = 0
ball_r=1.5
ball_dr = -.5
ball_x, ball_y = 0, 0
ball_dx, ball_dy = 1, 1

paddle_w = 14
paddle_h = 3
paddle_x = 64 - (paddle_w / 2)
paddle_y = 128 - paddle_h - 2

function _init()
    ball_x = rnd(128)
    ball_y = rnd(128)
end

function _update()
    frame = frame + 1
    if (frame % 10) == 0 then
        frame = 0
        ball_dr = -ball_dr
        ball_r = ball_r + ball_dr
    end 
    ball_x = ball_x + ball_dx
    ball_y = ball_y + ball_dy
    if (ball_x <= 2) or (ball_x > 126) then
        ball_dx = -ball_dx
    end
    if (ball_y <= 2) or (ball_y > 126) then 
        ball_dy = -ball_dy
    end
end

function _draw()
    rectfill(0 ,0, 128 , 128, 12)
    circfill(ball_x, ball_y, ball_r, 10)
    rectfill(paddle_x, paddle_y 
        , paddle_x + paddle_w, paddle_y + paddle_h 
        , 5)
    
end