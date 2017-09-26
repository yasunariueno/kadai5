# coding: utf-8
require 'dxruby'
require_relative 'player'
require_relative 'enemy'
require_relative 'fire'

t = Time.now #時間判定用
font = Font.new(32)
enemynum = 30 #enemyの数
hit = 0
enjo = 0

Window.width  = 800
Window.height = 600

player_img = Image.load("player.png")
player_img.setColorKey([255, 255, 255])

enemy_img = Image.load("enemy.png")
enemy_img.setColorKey([0, 0, 0])

fire_img = Image.load("fire.png")
fire_img.setColorKey([255, 255, 255])

player = Player.new(400, 500, player_img)

enemies = []
fire = []

Window.loop do
  break if Input.keyPush?(K_ESCAPE)
  t_past = Time.now
  timeInteger = t.tv_sec
  timeflag = t_past - t
  Window.draw_font(0,0,"#{t_past- t}",font)
  

  if(enemies.length < enemynum) #enemynum体ずつ落ちてくる
   enemies << Enemy.new(rand(800), -50 * [*1..6].sample, enemy_img)
  end
  if(timeflag.to_i % 6 == 0 && timeflag.to_i != 0)
   Window.draw_font(150,200,"#{hit}Retweet #{enjo}%炎上!!",font)
   enemies.clear
  end
  
  if((timeflag.to_i % [*9..11].sample) == 0 && hit > 100)
   fire << Fire.new(rand(800), -50, fire_img)
  end
  Sprite.update(enemies)
  Sprite.draw(enemies)

  Sprite.update(fire)
  Sprite.draw(fire)

  player.update
  player.draw

  # 当たり判定
  if(Sprite.check(player, enemies))
   hit += [*10..20].sample
  end
  if(Sprite.check(player, fire))
   enjo += [*5..25].sample
  end
end