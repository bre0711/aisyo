class PostsController < ApplicationController
  before_action :move_to_root, only: [:new, :create]

  def index
  end

  def new
    @posts = Post.order("created_at DESC")
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: @post.select.name)
      f.xAxis(categories: ["Soldier", "Wizard", "Monk", "Fighter", "Gunner"])
      f.series(name: "", yAxis: 1, data: [@post.vs_soldier_id,@post.vs_wizard_id,@post.vs_monk_id,@post.vs_fighter_id,@post.vs_gunner_id])
      f.yAxis [
        {title: {text: "", margin: 0} },
        {title: {text: ""}, opposite: true},
      ]
      f.legend(align: 'none')
      f.chart({defaultSeriesType: "column"})
    end

    else
      render "new"
    end
  end

  def my_soldier
    counter = Post.where(select_id: 2,user_id: current_user.id).last

    if counter != nil
    @s_chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: "Soldier")
      f.xAxis(categories: ["Soldier", "Wizard", "Monk", "Fighter", "Gunner"])
      f.series(name: "", yAxis: 1, data: [counter.vs_soldier_id,counter.vs_wizard_id,counter.vs_monk_id,counter.vs_fighter_id,counter.vs_gunner_id])
      f.yAxis [
        {title: {text: "", margin: 0} },
        {title: {text: ""}, opposite: true},
      ]
      f.legend(align: 'none')
      f.chart({defaultSeriesType: "column"})
    end

    else
      redirect_to root_path
    end
  end

  def my_wizard
    counter = Post.where(select_id: 3,user_id: current_user.id).last

    if counter != nil
    @w_chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: "Soldier")
      f.xAxis(categories: ["Soldier", "Wizard", "Monk", "Fighter", "Gunner"])
      f.series(name: "", yAxis: 1, data: [counter.vs_soldier_id,counter.vs_wizard_id,counter.vs_monk_id,counter.vs_fighter_id,counter.vs_gunner_id])
      f.yAxis [
        {title: {text: "", margin: 0} },
        {title: {text: ""}, opposite: true},
      ]
      f.legend(align: 'none')
      f.chart({defaultSeriesType: "column"})
    end

    else
      redirect_to root_path
    end
  end

  def my_monk
    counter = Post.where(select_id: 4,user_id: current_user.id).last

    if counter != nil
    @m_chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: "Soldier")
      f.xAxis(categories: ["Soldier", "Wizard", "Monk", "Fighter", "Gunner"])
      f.series(name: "", yAxis: 1, data: [counter.vs_soldier_id,counter.vs_wizard_id,counter.vs_monk_id,counter.vs_fighter_id,counter.vs_gunner_id])
      f.yAxis [
        {title: {text: "", margin: 0} },
        {title: {text: ""}, opposite: true},
      ]
      f.legend(align: 'none')
      f.chart({defaultSeriesType: "column"})
    end

    else
      redirect_to root_path
    end
  end

  def my_fighter
    counter = Post.where(select_id: 5,user_id: current_user.id).last

    if counter != nil
    @f_chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: "Soldier")
      f.xAxis(categories: ["Soldier", "Wizard", "Monk", "Fighter", "Gunner"])
      f.series(name: "", yAxis: 1, data: [counter.vs_soldier_id,counter.vs_wizard_id,counter.vs_monk_id,counter.vs_fighter_id,counter.vs_gunner_id])
      f.yAxis [
        {title: {text: "", margin: 0} },
        {title: {text: ""}, opposite: true},
      ]
      f.legend(align: 'none')
      f.chart({defaultSeriesType: "column"})
    end

    else
      redirect_to root_path
    end
  end

  def my_gunner
    counter = Post.where(select_id: 6,user_id: current_user.id).last
    if counter != nil
    @g_chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: "Soldier")
      f.xAxis(categories: ["Soldier", "Wizard", "Monk", "Fighter", "Gunner"])
      f.series(name: "", yAxis: 1, data: [counter.vs_soldier_id,counter.vs_wizard_id,counter.vs_monk_id,counter.vs_fighter_id,counter.vs_gunner_id])
      f.yAxis [
        {title: {text: "", margin: 0} },
        {title: {text: ""}, opposite: true},
      ]
      f.legend(align: 'none')
      f.chart({defaultSeriesType: "column"})
    end
    
    else
      redirect_to root_path
    end
  end
  
  def aisyo_soldier
    @counter = Post.where(select_id: 2).count
  
    sum_soldier = Post.where(select_id: 2).sum(:vs_soldier_id)
    sum_wizard = Post.where(select_id: 2).sum(:vs_wizard_id)
    sum_monk = Post.where(select_id: 2).sum(:vs_monk_id)
    sum_fighter = Post.where(select_id: 2).sum(:vs_fighter_id)
    sum_gunner = Post.where(select_id: 2).sum(:vs_gunner_id)
    
    soldier = sum_soldier / @counter.to_f
    wizard = sum_wizard / @counter.to_f
    monk = sum_monk / @counter.to_f
    fighter = sum_fighter / @counter.to_f
    gunner = sum_gunner / @counter.to_f

    soldier = soldier.floor(2).to_f
    wizard = wizard.floor(2).to_f
    monk = monk.floor(2).to_f
    fighter = fighter.floor(2).to_f
    gunner = gunner.floor(2).to_f
  
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: "Soldier")
      f.xAxis(categories: ["Soldier", "Wizard", "Monk", "Fighter", "Gunner"])
      f.series(name: "", yAxis: 1, data: [soldier,wizard,monk,fighter,gunner])
      f.yAxis [
        {title: {text: "", margin: 0} },
        {title: {text: ""}, opposite: true},
      ]
      f.legend(align: 'none')
      f.chart({defaultSeriesType: "column"})
    end
  end

  def aisyo_wizard
    @counter = Post.where(select_id: 3).count
  
    sum_soldier = Post.where(select_id: 3).sum(:vs_soldier_id)
    sum_wizard = Post.where(select_id: 3).sum(:vs_wizard_id)
    sum_monk = Post.where(select_id: 3).sum(:vs_monk_id)
    sum_fighter = Post.where(select_id: 3).sum(:vs_fighter_id)
    sum_gunner = Post.where(select_id: 3).sum(:vs_gunner_id)
    
    soldier = sum_soldier / @counter.to_f
    wizard = sum_wizard / @counter.to_f
    monk = sum_monk / @counter.to_f
    fighter = sum_fighter / @counter.to_f
    gunner = sum_gunner / @counter.to_f
  
    soldier = soldier.floor(2).to_f
    wizard = wizard.floor(2).to_f
    monk = monk.floor(2).to_f
    fighter = fighter.floor(2).to_f
    gunner = gunner.floor(2).to_f

    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: "Wizard")
      f.xAxis(categories: ["Soldier", "Wizard", "Monk", "Fighter", "Gunner"])
      f.series(name: "", yAxis: 1, data: [soldier,wizard,monk,fighter,gunner])
      f.yAxis [
        {title: {text: "", margin: 0} },
        {title: {text: ""}, opposite: true},
      ]
      f.legend(align: 'none')
      f.chart({defaultSeriesType: "column"})
    end
  end

  def aisyo_monk
    @counter = Post.where(select_id: 4).count
  
    sum_soldier = Post.where(select_id: 4).sum(:vs_soldier_id)
    sum_wizard = Post.where(select_id: 4).sum(:vs_wizard_id)
    sum_monk = Post.where(select_id: 4).sum(:vs_monk_id)
    sum_fighter = Post.where(select_id: 4).sum(:vs_fighter_id)
    sum_gunner = Post.where(select_id: 4).sum(:vs_gunner_id)
    
    soldier = sum_soldier / @counter.to_f
    wizard = sum_wizard / @counter.to_f
    monk = sum_monk / @counter.to_f
    fighter = sum_fighter / @counter.to_f
    gunner = sum_gunner / @counter.to_f
  
    soldier = soldier.floor(2).to_f
    wizard = wizard.floor(2).to_f
    monk = monk.floor(2).to_f
    fighter = fighter.floor(2).to_f
    gunner = gunner.floor(2).to_f

    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: "Monk")
      f.xAxis(categories: ["Soldier", "Wizard", "Monk", "Fighter", "Gunner"])
      f.series(name: "", yAxis: 1, data: [soldier,wizard,monk,fighter,gunner])
      f.yAxis [
        {title: {text: "", margin: 0} },
        {title: {text: ""}, opposite: true},
      ]
      f.legend(align: 'none')
      f.chart({defaultSeriesType: "column"})
    end
  end

  def aisyo_fighter
    @counter = Post.where(select_id: 5).count
  
    sum_soldier = Post.where(select_id: 5).sum(:vs_soldier_id)
    sum_wizard = Post.where(select_id: 5).sum(:vs_wizard_id)
    sum_monk = Post.where(select_id: 5).sum(:vs_monk_id)
    sum_fighter = Post.where(select_id: 5).sum(:vs_fighter_id)
    sum_gunner = Post.where(select_id: 5).sum(:vs_gunner_id)
    
    soldier = sum_soldier / @counter.to_f
    wizard = sum_wizard / @counter.to_f
    monk = sum_monk / @counter.to_f
    fighter = sum_fighter / @counter.to_f
    gunner = sum_gunner / @counter.to_f
  
    soldier = soldier.floor(2).to_f
    wizard = wizard.floor(2).to_f
    monk = monk.floor(2).to_f
    fighter = fighter.floor(2).to_f
    gunner = gunner.floor(2).to_f

    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: "Fighter")
      f.xAxis(categories: ["Soldier", "Wizard", "Monk", "Fighter", "Gunner"])
      f.series(name: "", yAxis: 1, data: [soldier,wizard,monk,fighter,gunner])
      f.yAxis [
        {title: {text: "", margin: 0} },
        {title: {text: ""}, opposite: true},
      ]
      f.legend(align: 'none')
      f.chart({defaultSeriesType: "column"})
    end
  end

  def aisyo_gunner
    @counter = Post.where(select_id: 6).count
  
    sum_soldier = Post.where(select_id: 6).sum(:vs_soldier_id)
    sum_wizard = Post.where(select_id: 6).sum(:vs_wizard_id)
    sum_monk = Post.where(select_id: 6).sum(:vs_monk_id)
    sum_fighter = Post.where(select_id: 6).sum(:vs_fighter_id)
    sum_gunner = Post.where(select_id: 6).sum(:vs_gunner_id)
    
    soldier = sum_soldier / @counter.to_f
    wizard = sum_wizard / @counter.to_f
    monk = sum_monk / @counter.to_f
    fighter = sum_fighter / @counter.to_f
    gunner = sum_gunner / @counter.to_f
  
    soldier = soldier.floor(2).to_f
    wizard = wizard.floor(2).to_f
    monk = monk.floor(2).to_f
    fighter = fighter.floor(2).to_f
    gunner = gunner.floor(2).to_f
        
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: "Gunner")
      f.xAxis(categories: ["Soldier", "Wizard", "Monk", "Fighter", "Gunner"])
      f.series(name: "", yAxis: 1, data: [soldier,wizard,monk,fighter,gunner])
      f.yAxis [
        {title: {text: "", margin: 0} },
        {title: {text: ""}, opposite: true},
      ]
      f.legend(align: 'none')
      f.chart({defaultSeriesType: "column"})
    end
  end

  private

  def post_params
    params.require(:post).permit(:select_id,:vs_soldier_id,:vs_wizard_id,:vs_monk_id,:vs_fighter_id,:vs_gunner_id).merge(user_id: current_user.id)
  end

  
  def move_to_root
    redirect_to root_path unless user_signed_in?
  end
end

