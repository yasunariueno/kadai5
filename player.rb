# coding: utf-8

class Player < Sprite
  def update
    self.x = Input.mouse_pos_x
    self.y = Input.mouse_pos_y
  end
end