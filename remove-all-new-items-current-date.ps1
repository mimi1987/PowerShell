 foreach ($file in (get-childitem)) { if ($file.CreationTime.Date -eq (get-date).Date) {rm $file -Recurse -Force}}
