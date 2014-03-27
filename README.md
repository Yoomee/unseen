###Adding an edition
* Find or create the CMS parent page for the galleries of the new edition, e.g. "Galleries 2014". Set it's slug to `"galleries_#{edition}"`, e.g. `galleries_2014`.
* Find or create the CMS parent page for the venues of the new edition, e.g. "Venues 2014". Set it's slug to `"venues_#{edition}"`, e.g. `venues_2014`.
* In `config/settings.yml`, add the new edition to the `editions` array and set it as the `current_edition` if it's ready to go live now.
* Commit the changes to `config/settings.yml`, push and deploy.
