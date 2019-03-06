class Car
  # 定数を追加
  UP_SPEED = 10
  DOWN_SPEED = 20
  #乗車人数の最大値を追加
  MAX_PASSENGERS = 4

  @@count = 0
  #passengersをアクセサメソッドを追加
  attr_accessor :number, :color, :passengers
  # speedは外部から設定しないのでreaderで定義
  # @speedが使えるようになる
  attr_reader :speed

  def initialize(number, color)
    @number = number
    @color = color
    # @speedを初期化
    @speed = 0
    #運転手を追加
    @passengers = 1
    @@count += 1
  end

  # 加速用のメソッド追加
  def speed_up
    @speed += UP_SPEED
    if @speed >= 50
      puts "[ALERT]スピードが#{@speed}になりました。減速します。"
      #speed_downメソッドを用いて減速する
      speed_down
    elsif @speed >= 30 
      puts "[ALERT]スピードが#{@speed}になりました。" 
    end
  end

  # 減速用のメソッド追加
  def speed_down
    # ifの結果を変数に代入する場合は以下の記述でOK
    @speed = if @speed - DOWN_SPEED < 0
               0
             else
               @speed - DOWN_SPEED
             end
  end
  #乗車メソッドを追加
  def get_on
    if @passengers < MAX_PASSENGERS
      @passengers += 1
      puts "乗車しました。"
    else
      puts "乗車できません。この車の最大乗車人数は#{MAX_PASSENGERS}人です。"
      @passengers
    end
    
  end

  def self.count
    @@count  # return @@countの略
  end
  #クラス変数を表示するメソッドを追加
  def self.count_info
    "Carクラスのクラス変数@@countは#{@@count}です。"
  end

end
#Carクラスを継承するTrackCarクラスを追加
class TrackCar < Car

  attr_reader :load_weight

  def initialize(number, color, load_weight = 500)
    #superを追加し拡張性を広げる
    super(number, color)
    @load_weight = load_weight
  end

end