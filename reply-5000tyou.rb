# -*- coding: utf-8 -*-

Plugin.create(:reply_5000tyou_post) do
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
			emoji(msg.message,'otintin_open.jpg')
		end
	end
	
	command(:reply_otintin_close_post,
					name: 'おちんちんランド閉園',
					condition: Plugin::Command[:CanReplyAll],
					visible: true,
					role: :timeline) do |m|
		m.messages.map do |msg|
			emoji(msg.message,'otintin_close.jpg')
		end
	end
	
	command(:reply_otintin_opose_post,
					name: 'おちんちんランド開閉',
					condition: Plugin::Command[:CanReplyAll],
					visible: true,
					role: :timeline) do |m|
		m.messages.map do |msg|
			emoji(msg.message,'otintin_opose.jpg')
		end
	end
	
	command(:reply_final_post,
					name: '最終形態',
					condition: Plugin::Command[:CanReplyAll],
					visible: true,
					role: :timeline) do |m|
		m.messages.map do |msg|
			emoji(msg.message,'final.jpg')
		end
	end

	def emoji(m,f)
		world, = Plugin.filtering(:world_current, nil)
		id = m.idname
		message = ""
		compose(world, body: message, to: m, mediaiolist: [File.new(File.join(__dir__, 'image', f))])
					.next { |tweet_message|
						notice tweet_message
					} .trap { |err|
						error err
					}
	end
end
