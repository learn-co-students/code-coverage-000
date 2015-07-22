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
  it "takes a name when created" do
    song = Song.new("A song")
    expect(song.name).to eq("A song")
  end	
end

describe Jukebox do
  it "takes songs when created" do
  	expect{Jukebox.new(songs)}.to_not raise_error
  end	

  context "has methods:" do
  	let(:juke) {Jukebox.new(songs)}
  	
  	it "'list' lists all its songs" do
  	  expect(juke.command('list')).to eq(songs.each_with_index.each_with_object("") { |(song, i), str| str << "#{i+1} #{song}\n" } )
  	end

    it "'play' plays a song" do
      song = songs[0]
      expect(juke.command("play #{song}")).to eq("now playing #{song}")
    end

    it "'help' shows help" do
      expect(juke.command('help')).to eq("Please select help, list, exit, or play.")
    end

  	it "'exit' turns it off" do
  	  expect(juke.on?).to eq(true)
  	  juke.command('exit')
  	  expect(juke.on?).to eq(false)
  	end

  	it "responds to invalid commands" do
      expect(juke.command("unknown")).to eq("invalid command")
  	end
  end
end
