###Adding an edition
* Find or create the CMS parent page for the galleries of the new edition, e.g. "Galleries 2014". Set it's slug to `"galleries_#{edition}"`, e.g. `galleries_2014`.
* Find or create the CMS parent page for the venues of the new edition, e.g. "Venues 2014". Set it's slug to `"venues_#{edition}"`, e.g. `venues_2014`.
* In `config/settings.yml`, add the new edition to the `editions` array and set it as the `current_edition` if it's ready to go live now.
* Add the festival dates to `Event::FESTIVAL_DATES` in `app/models/event.rb`
* Commit the changes, push and deploy.
* Set the edition of the two new CMS pages to the new edition.

###Bundling
If you have problems bundling and get an error something like:
```
Gem::Ext::BuildError: ERROR: Failed to build gem native extension.
```
You should be able to install the gem by doing this:
*Find your path to ruby
```
gem list coffee-rails -d
```
gives output like
```
coffee-rails (3.1.1)
    Author: Santiago Pastorino
    Installed at: /Users/edwardandrews-hodgson/.rvm/gems/ruby-1.9.2-head

    Coffee Script adapter for the Rails asset pipeline.
```
The bit like `ruby-1.9.2-head` is what you need for the next command

```
gem install gem_that_failed -v *.*.*  -- --with-ruby-include=$rvm_path/src/ruby-1.9.2-head/
```
I had to do this with linecache and ruby-debug
```
 gem install linecache19 -v '0.5.12' -- --with-ruby-include=$rvm_path/src/ruby-1.9.2-head/
gem install ruby-debug-base19 -v '0.11.25'  -- --with-ruby-include=$rvm_path/src/ruby-1.9.2-head/
```
