require 'pry'

# Use this song data for your tests
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
  let(:song) { Song.new("test") }
  it 'initializes with a name' do 
    expect(song.name).to eq("test")
  end

  it 'can change its name' do 
    song.name = "new name"
    expect(song.name).to eq("new name")
  end
end

describe Jukebox do
  let(:jukebox) { Jukebox.new(songs) }
  context 'initialize' do 
    it 'initializes with songs' do 
      expect(jukebox.songs).to eq(songs)
    end

    it 'initializes with on as true' do 
      expect(jukebox.on?).to eq(true)
    end

    it 'can change its songs array' do 
      jukebox.songs = ["new", "array"]
      expect(jukebox.songs).to eq(["new", "array"])
    end
  end

  context 'approved commands' do
    it 'has a list of approved commands' do 
      expect(Jukebox::APPROVED_COMMANDS).to eq([:list, :help, :exit])
    end
  end

  context '#on?' do 
    it 'returns whether or not the jukebox is on' do 
      expect(jukebox.on?).to eq(true)
    end
  end

  context '#help' do
    it 'returns a help message' do 
      expect(jukebox.help).to eq("Please select help, list, exit, or play.")
    end
  end

  context '#command parses use input and sends that to the appropriate method' do
    it 'calls help' do 
      expect(jukebox.command('help')).to eq("Please select help, list, exit, or play.")
    end

    it 'calls exit' do 
      expect(jukebox.command('exit')).to eq("Goodbye, thanks for listening!")
    end

    it 'calls list' do 
      expect(jukebox.command('list')).to eq("1 The Phoenix - 1901\n2 Tokyo Police Club - Wait Up\n3 Sufjan Stevens - Too Much\n4 The Naked and the Famous - Young Blood\n5 (Far From) Home - Tiga\n6 The Cults - Abducted\n7 The Phoenix - Consolation Prizes\n")
    end

    it 'calls play' do 
      expect(jukebox.command("play 1 The Phoenix - 1901")).to eq("now playing 1 The Phoenix - 1901")
    end

    it 'handles an invalid command' do 
      expect(jukebox.command("wat")).to eq("invalid command")
    end
  end

  context '#exit' do
    it 'sets the jukebox on to false' do
      jukebox.exit
      expect(jukebox.on?).to eq(false) 
    end

    it 'returns a goodbye message' do 
      expect(jukebox.exit).to eq("Goodbye, thanks for listening!")
    end
  end

  context '#list' do
    it 'returns a list of the songs numbered' do 
      expect(jukebox.list).to eq("1 The Phoenix - 1901\n2 Tokyo Police Club - Wait Up\n3 Sufjan Stevens - Too Much\n4 The Naked and the Famous - Young Blood\n5 (Far From) Home - Tiga\n6 The Cults - Abducted\n7 The Phoenix - Consolation Prizes\n")
    end
  end

  context '#play' do
    it 'plays a song' do 
      expect(jukebox.play("1 The Phoenix - 1901")).to eq("now playing 1 The Phoenix - 1901")
    end
  end
end
