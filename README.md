# StrangeCapybaraHang
https://stackoverflow.com/questions/74722080/whenever-i-add-capybara-using-session-to-my-project-my-rspec-suite-seem-to



1. Clone repo
2. run `./bin/setup`
3. run `rspec`

Rspec hangs after entire suite EVEN THOUGH the tests pass:


![Monosnap VDQApp-borked — rspec spec:system:test_capy_hang rb ▸ Google Chrome Helper (Renderer) — 158×31 2022-12-13 12-30-43](https://user-images.githubusercontent.com/59002/207404109-0d50da30-61d4-4998-9936-06ad68a9b8ae.png)


NOTICE that if you do ANY of the following FOUR THINGS things, Rspec DOES NOT HANG:

1. Comment out `gem 'debug', platforms: %i[ mri mingw x64_mingw ]` in `Gemfile`

2. in the `spec/system/test_capy_hang_spec.rb`, comment out the first `visit` line (the one inside `Capybara.using_session("client session") do`)

```
require 'rails_helper'
describe "client app", type: :feature  do
  describe "when starting the experience", type: :feature do
    # TODO: figure out why capy is hanging here

    it "can load the home page" do
      # THIS CAUSES HANG
      Capybara.using_session("client session") do
        #visit "/"
      end
    end

    it "loads with a client id" do
      visit '/'
    end
  end
end
```

3. in the `spec/system/test_capy_hang_spec.rb`, comment out the SECOND `visit` line

```
require 'rails_helper'
describe "client app", type: :feature  do
  describe "when starting the experience", type: :feature do
    # TODO: figure out why capy is hanging here

    it "can load the home page" do
      # THIS CAUSES HANG
      Capybara.using_session("client session") do
        visit "/"
      end
    end

    it "loads with a client id" do
      #visit '/'
    end
  end
end
```

or 4. remove the `visit "/"` from outside of the `Capybara.using_session("client session") do` block
```
require 'rails_helper'
describe "client app", type: :feature  do
  describe "when starting the experience", type: :feature do
    # TODO: figure out why capy is hanging here

    it "can load the home page" do
      # THIS CAUSES HANG
      visit "/"
      Capybara.using_session("client session") do
       
      end
    end

    it "loads with a client id" do
      #visit '/'
    end
  end
end
```





