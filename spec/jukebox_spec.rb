# Use this song data focar your tests



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
  let(:song) { Song.new(songs) }

  it "is a song" do
  expect(song).to be_a(Song)
  end
end

describe Jukebox do
  let(:jukebox) { Jukebox.new(songs) }
  it "can initialize an jukebox" do
    expect(jukebox).to be_a(Jukebox)
  end

  it "initializes with a songs" do
    expect(jukebox.songs).to eq(songs)
  end

  it "initializes with a on status true" do
    expect(jukebox.on?).to eq(true)
  end

  it "can help" do
    expect(jukebox.help).to eq("Please select help, list, exit, or play.")
  end

  it "lists songs" do
    list = ""
    songs.each_with_index do |song, i|
      list += "#{i+1} #{song}\n"
    end
    expect(jukebox.list).to eq(list)
  end



  it "can handle commands" do
    expect(jukebox.command("help")).to eq("Please select help, list, exit, or play.")
    expect(jukebox.command("play The Phoenix - Consolation Prizes")).to eq(jukebox.play("The Phoenix - Consolation Prizes"))
    expect(jukebox.command("helppp")).to eq("invalid command")
    #expect(jukebox.command("list")).to eq("Please select help, list, exit, or play.")
  end


  it "can exit" do
    expect(jukebox.exit).to eq("Goodbye, thanks for listening!")
    expect(jukebox.on?).to eq(false)
  end

  it "can play music" do
    songs.each{|song| expect(jukebox.play(song)).to eq("now playing #{song}")}
  end
end
