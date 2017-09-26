# coding: utf-8

class Fire < Sprite
  def update
    self.y += [*5..8].sample
    if self.y >= Window.height - self.image.height
      self.vanish
    end
  end

  # 他のオブジェクトから衝突された際に呼ばれるメソッド
  def hit(obj)
    self.vanish
  end
end