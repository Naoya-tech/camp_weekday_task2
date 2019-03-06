require './car'

track_car1 = TrackCar.new(200, 'white')
puts "TrackCarクラスのインスタンス生成時にload_weightを指定した場合：#{track_car1.load_weight}"

track_car2 = TrackCar.new(300, 'black', 300)
puts "TrackCarクラスのインスタンス生成時にload_weightを指定(300)した場合：#{track_car2.load_weight}"