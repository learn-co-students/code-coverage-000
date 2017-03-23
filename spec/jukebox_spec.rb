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
  it "has a name" do
   michael = Song.new("Billy Jean")
   expect(michael.name).to eq("Billy Jean")
  end

end



describe Jukebox do
  let(:jukey) {Jukebox.new(songs)}
  it "has all the songs" do
    expect(jukey.songs).to eq(songs) 
  end

  it "it shuts off when checking off" do
    jukey.command("exit")
    expect(jukey.on?).to eq(false)
  end

  it "can list all the songs" do
    expect(jukey.list).to include("The Cults - Abducted")
  end

  it "can be helpful" do
    expect { jukey.help }.to output("Please select help, list, exit, or play.\n").to_stdout
  end

  it "starts w/ on" do
   expect(jukey.on?).to eq(true)
  end

  it "knows a bad response" do
    expect(jukey.command("animal")).to eq("invalid command")
  end

  it "has the Approved commands" do
    expect(Jukebox::APPROVED_COMMANDS).to eq([:list, :help, :exit])
  end

  it "can play the songs" do
    expect(jukey.play("Yo Fat Mama")).to eq("now playing Yo Fat Mama")
  end

  it "can exit" do
    expect(jukey.exit).to eq("Goodbye, thanks for listening!")
  end

  it "can play" do
    expect(jukey.command("play Baby boy")).to eq("now playing Baby boy")
  end



end
