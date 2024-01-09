#! /bin/bash

for f in /mnt/c/Users/cwt61523/ChristmassongslyricsApp/*.txt; do
  echo "processing $f"
  content=$(cat "$f")
  title="Christmas songs lyrics"
  html=$(cat <<EOF
<html>
<head>
  <title>$title</title>
  <style>
    body {
      background-image: url('https://images.pexels.com/photos/744969/pexels-photo-744969.jpeg?auto=compress&cs=tinysrgb&w=600'); /* Replace with the actual image URL */ 
      background-size: cover;
      font-family: Arial; /* Use a suitable font-family */
      display: flex;
      align-items: center;
      justify-content: center;
      #height: 100vh; /* Ensure full height of the viewport */
     # margin: 0; /* Remove default body margin */
    }
 #   h1 {
  #    font-family: 'Times New Roman'; /* Change the font family for the header */
   #   font-weight: bold; /* Make the header bold */
    #  font-size: 24px; /* Change the font size for the header */
    #}
    pre {
      margin: 20px; /* Add some margin for better readability */
      text-align: center; /* Center the text content */
      font-size: 16px; /* Change the font size to your desired value */
    }
  </style>
</head>
<body>
  <pre>$content</pre>
</body>
</html>
EOF
)
  echo "$html" > lyrics.html
 # cmd.exe /C start lyrics.html  # Open the HTML file in the default web browser using cmd.exe
done
firefox "lyrics.html"
