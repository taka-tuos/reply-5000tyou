# -*- coding: utf-8 -*-

Plugin.create(:d250g2_emoji) do
  command(:reply_5000tyou_post,
          name: '5000兆円欲しい！',
          condition: Plugin::Command[:CanReplyAll],
          visible: true,
          role: :timeline) do |m|
    m.messages.map do |msg|
      emoji(msg.message,'5000tyou.png')
    end
  end
  
  command(:reply_mori_post,
          name: 'うんこもりもり森鴎外',
          condition: Plugin::Command[:CanReplyAll],
          visible: true,
          role: :timeline) do |m|
    m.messages.map do |msg|
      emoji(msg.message,'mori.png')
    end
  end
  
  command(:reply_otintin_open_post,
          name: 'おちんちんランド開園',
          condition: Plugin::Command[:CanReplyAll],
          visible: true,
          role: :timeline) do |m|
    m.messages.map do |msg|
      emoji(msg.message,'otintin_open.png')
    end
  end
  
  command(:reply_otintin_close_post,
          name: 'おちんちんランド閉園',
          condition: Plugin::Command[:CanReplyAll],
          visible: true,
          role: :timeline) do |m|
    m.messages.map do |msg|
      emoji(msg.message,'otintin_close.png')
    end
  end
  
  command(:reply_otintin_opose_post,
          name: 'おちんちんランド開閉',
          condition: Plugin::Command[:CanReplyAll],
          visible: true,
          role: :timeline) do |m|
    m.messages.map do |msg|
      emoji(msg.message,'otintin_opose.png')
    end
  end
  
  command(:reply_final_post,
          name: '最終形態',
          condition: Plugin::Command[:CanReplyAll],
          visible: true,
          role: :timeline) do |m|
    m.messages.map do |msg|
      emoji(msg.message,'final.png')
    end
  end

  def emoji(m,f)
    id = m.idname
    message = "@#{id}"
    Thread.new {
      m.post(message: message,
             mediaiolist: [File.new(File.join(__dir__, 'image', f))])
    }.trap { |err|
      error err
    }
  end
end
