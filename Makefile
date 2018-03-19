git:
	@ echo "Adding to GitHub/Vogsphere"
	@ git add .
	@ echo "What will be your message in your commit?"
	@ read msg && git commit -m "$$msg"
	@ echo "Pushing latest dotfiles"
	@ git push
