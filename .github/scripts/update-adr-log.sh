# Ordered by date
> index.md

# Create a temporary file to store filenames and their dates
temp_file=$(mktemp)

# Extract the date from each file and store it with the filename
find adr -type f -name "*.md" | while read -r file; do
  # Skip a specific file (e.g., adr/excluded-file.md)
  if [[ "$file" == "adr/adr-flow-readme.md" ]]; then
    echo "Skipping file: $file"
    continue
  fi
  # Extract the date from the file (assuming the date is in the format `**Date:** DD-MMM-YYYY`)
  date=$(grep -oP '(?<=\*\*Date:\*\* ).*' "$file" | head -n 1)
  echo "$date|$file" >> "$temp_file"
done

# Sort the files by date (ascending order)
sorted_files=$(sort -t '|' -k1 -r "$temp_file")

# Process the files in sorted order
echo "$sorted_files" | while IFS='|' read -r date file; do
  # Extract the ADR number (first 4 characters of the filename)
  adr_number=$(basename "$file" .md | cut -c1-4)

  # Generate the relative file path for the link
  file_link=$(basename "$file")

  # Extract content between <!-- log start --> and <!-- log end -->, prepend ADR number as a link, and append to index.md
  sed -n '/<!-- log start -->/,/<!-- log end -->/p' "$file" | sed "2s/^/- [ADR-$adr_number](adr\/$file_link) - /" | sed '/<!-- log start -->/d; /<!-- log end -->/d' >> index.md

  # Delete content between <!-- log start --> and <!-- log end --> (inclusive) in the original file
  sed -i '/<!-- log start -->/,/<!-- log end -->/d' "$file"
done

# Clean up the temporary file
rm "$temp_file"
