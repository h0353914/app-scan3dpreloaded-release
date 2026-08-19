function clamprange(n, min, max)
 if n < min then return min end
 if n > max then return max end
 return n
end


upper_lip_raiser = clamprange(2.0 *  au(6), 0, 1.5)
lip_stretch = clamprange(au(7), -1.0, 1.0)
lip_corner_depr = clamprange(0.8 * au(8), -0.8, 0.8)
lip_presser = au(9)

set_bs(0, upper_lip_raiser)
set_bs(1, lip_presser)
set_bs(2, lip_stretch)
set_bs(3, lip_corner_depr)

left_eye=clamprange(au(32) * 25.0 + au(34) * 15.0, 0, 1)
set_bs(4, left_eye)

right_eye=clamprange(au(33) * 25.0 + au(35) * 15.0, 0, 1)
set_bs(5, right_eye)

-- jaw_drop is in degrees. Accept 20 degrees open, but only -5 closed
jaw_drop=clamprange(au(5) * 20, -5, 20)
jaw_x = clamprange(au(4) * 10, -10, 10)
set_rot(6, jaw_drop, jaw_x, 0)

-- Rotation of head
set_rot(4, -rot_y(), -rot_x(), -rot_z())

-- Rotate the eyes
set_rot(8, eye_rot_x(0)-18, -eye_rot_y(0), 0)
set_rot(10, eye_rot_x(1)-18, eye_rot_y(1), 0)

-- Adjust initial model transform
set_pos(0, 0, -0.25, 0)
set_scale(0, 9, 9, 9)
