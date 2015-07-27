require 'spec_helper'

songs = [
  "The Phoenix - 1901",
  "Tokyo Police Club - Wait Up",
  "Sufjan Stevens - Too Much",
  "The Naked and the Famous - Young Blood",
  "(Far From) Home - Tiga",
  "The Cults - Abducted",
  "The Phoenix - Consolation Prizes"
]

describe Song do

	let(:song_instance) { Song.new("Fred")}

	it 'initializes with a name' do
		expect(song_instance.name).to eq("Fred")
	end

end

describe Jukebox do

	let(:song_instance) { Song.new("Fred")}
	let(:jukebox_instance) { Jukebox.new(songs)}

	it 'initializes with songs parameter' do
		expect(jukebox_instance.songs).to eq(songs)
	end

	it 'turns on when initialized' do
		expect(jukebox_instance.on?).to eq(true)
	end

	it 'responds to "help" command' do
		expect(jukebox_instance.command("help")).to eq("Please select help, list, exit, or play.")
	end

	it 'responds to "list" command' do
		expect(jukebox_instance.list).to include(songs[5])
		expect(jukebox_instance.command('list')).to eq(jukebox_instance.list)
	end

	it 'responds to "exit" command' do
		expect(jukebox_instance.exit).to eq("Goodbye, thanks for listening!")
		expect(jukebox_instance.command('exit')).to eq(jukebox_instance.exit)
		jukebox_instance.exit
		expect(jukebox_instance.on?).to eq(false)
	end

	it 'responds to invalid command' do
		expect(jukebox_instance.command('Arnold')).to eq("invalid command")
	end

	it 'responds to "play" command' do
		sample = "sample"
		expect(jukebox_instance.play(sample)).to eq("now playing #{sample}")
		expect(jukebox_instance.command('play sample')).to eq(jukebox_instance.play(sample))
	end

end
