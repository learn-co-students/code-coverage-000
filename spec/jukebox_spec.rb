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

song_titles = songs.map{|song| song.split(" - ").last}

describe Song do

  before :each do
    @song = Song.new(song_titles.sample)
  end

  describe "#new" do
    it "has a name" do
      expect(song_titles).to include(@song.name)
    end
  end

end

describe Jukebox do
  
  before :each do
    @jukebox = Jukebox.new(songs)
  end

  describe "#new" do

    it "initializes with a name" do
      expect(@jukebox.songs).to eq songs  
    end

    it "turns 'on' upon initialization" do
      expect(@jukebox.instance_variable_get('@on')).to eq true   
    end

  end

  describe "#on?" do

    it "returns true when it is on" do
      expect(@jukebox.on?).to eq true
    end

  end

  describe "#help" do

    it "returns a help message" do
      expect(@jukebox.help).to eq "Please select help, list, exit, or play."
    end

  end

  describe "#command" do

    it "accepts commands" do
      expect{@jukebox.command("Gobidly Gook")}.not_to raise_error
    end

    it "handles approved commands" do
      expect(@jukebox.command(" HeLp  ")).to eq @jukebox.help
      expect(@jukebox.command("play Bamboo")).to eq @jukebox.play("Bamboo")
    end

    it "handles unapproved commands" do
      expect(@jukebox.command("Golf is a fun game.")).to eq "invalid command"
    end

  end

  describe "#exit" do

    before do 
      @jukebox.exit
    end

    it "turns off the jukebox" do
      expect(@jukebox.on?) == false
    end

    it "returns and exit message" do
      expect(@jukebox.exit).to eq "Goodbye, thanks for listening!"
    end

  end

  describe "#list" do

    it "lists the songs" do
      list = ""
      songs.each.with_index{|song, i| list << "#{i+1} #{song}\n"}
      expect(@jukebox.list).to eq list
    end

  end

end
