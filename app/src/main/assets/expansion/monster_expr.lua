function clamprange(n, min, max)
 if n < min then return min end
 if n > max then return max end
 return n
end

set_bs(0, au(2)) -- nose left wrinkler
set_bs(1, au(1)) -- nose right wrinkler
set_bs(2, au(7)) -- lip_stretch
set_bs(3, clamprange(1.0 - au(32) * 25, -2, 2)) -- close_t_l_eyelid
set_bs(4, clamprange(1.0 - au(33) * 25, -2, 2)) -- close_t_r_eyelid
set_bs(5, au(6)) -- upper_lip_raiser
set_bs(6, au(0)) -- nose_wrinkler
set_bs(7, clamprange(0.75 - au(33) * 12.5, -2, 2)) -- close_b_r_eyelid
set_bs(8, clamprange(0.75 - au(32) * 12.5, -2, 2)) -- close_b_l_eyelid
set_bs(9, au(9)) -- lip_presser
set_bs(10, au(8) * 3) -- lip_corner_depr

set_bs(12, clamprange(au(50) * 20, -1, 1)) -- squeeze_l_eyebrow
set_bs(13, clamprange(au(51) * 20, -1, 1)) -- squeeze_r_eyebrow

-- Eyebrows
set_bs(18, clamprange(au(48) * 25, -2, 2)) -- raise_l_o_eyebrow
set_bs(11, clamprange(au(46) * 25, -2, 2)) -- raise_l_m_eyebrow X
set_bs(17, clamprange(au(44) * 25, -2, 2)) -- raise_l_i_eyebrow X
set_bs(16, clamprange(au(45) * 25, -2, 2)) -- raise_r_i_eyebrow X
set_bs(14, clamprange(au(49) * 25, -2, 2)) -- raise_r_o_eyebrow
set_bs(15, clamprange(au(47) * 25, -2, 2)) -- raise_r_m_eyebrow

-- jaw_x_push and jaw_drop.
set_rot(41, au(4) * 10, 0, -au(5) * 25)

-- Rotation of head
set_rot(12, -rot_y(), rot_z(), -rot_x())

-- Rotate the eyes
set_rot(33, -8.0 - eye_rot_y(0), 0, clamprange(25-eye_rot_x(0), -20, 10))
set_rot(37, 8.0 - eye_rot_y(1), 0, clamprange(25-eye_rot_x(1), -20, 10))


-- Adjust initial model transform
set_pos(11, 0, -12, 0)
set_scale(11, 11.5, 11.5, 11.5)
