-- Ensure you have a speaker attached to the computer
local speaker = peripheral.find("speaker")

if not speaker then
  print("No speaker found! Attach a speaker peripheral.")
  return
end

-- URL of the .dfpwm file in the GitHub repository (raw link)
local url = "https://github.com/Fish1rs/CC-Music/raw/main/_NSYNC%20-%20Bye%20Bye%20Bye%20(Lyrics)%20(Deadpool%203%20Soundtrack).dfpwm"

-- Path to save the downloaded file locally
local filePath = "_NSYNC - Bye Bye Bye (Lyrics) (Deadpool 3 Soundtrack).dfpwm"

-- Function to download a file from a URL
local function downloadFile(url, path)
    local response = http.get(url)
    if response then
        local file = fs.open(path, "wb")
        file.write(response.readAll())
        file.close()
        response.close()
        return true
    else
        return false
    end
end

-- Download the file
local success = downloadFile(url, filePath)

if success then
  print("File downloaded successfully!")
else
  print("Failed to download the file.")
  return
end

-- Open the downloaded file in binary mode
local file = fs.open(filePath, "rb")

if not file then
  print("Could not open the downloaded audio file.")
  return
end

-- Play the audio file
speaker.playAudio(file)

-- Close the file after playing
file.close()
