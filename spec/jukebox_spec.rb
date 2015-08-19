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
  let(:song) { Song.new("Test Song") }

  it "can initialize a song" do
    expect(song).to be_a(Song)
  end
end

describe Jukebox do
    let(:jukebox) { Jukebox.new(['Song 1','Song 2','Song 3']) }

  it "can initialize a jukebox" do
    expect(jukebox).to be_a(Jukebox)
  end

  it "can check if on" do
    expect(jukebox.on?).to eq(jukebox.on?)
  end

  it "has a help menu" do
    expect(jukebox.help).to eq("Please select help, list, exit, or play.")
  end

  it "can be exited" do
    jukebox.exit
    expect(jukebox.exit).to eq("Goodbye, thanks for listening!")
    expect(jukebox.on?).to eq(false)
  end

  it "can return a list" do
    jukebox.list
    expect(jukebox.list).not_to be_empty
  end

  it "can play a song" do
    expect(jukebox.play("Test Play Song")).to eq("now playing Test Play Song")
  end

  it "can accept approved commands" do
    expect(jukebox.command("list")).not_to be_empty
    expect(jukebox.command("help")).to eq("Please select help, list, exit, or play.")
    expect(jukebox.command("invalid test")).to eq("invalid command")
  end

  it "can accept play command" do
    expect(jukebox.command("play $ong")).to eq("now playing $ong")
  end


end
