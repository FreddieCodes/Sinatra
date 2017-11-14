feature 'Testing homepage' do
    xit 'Can run app and check page content' do
      visit('/')
      fill_in('city', :with => 'London')
      click_button('Submit')
      expect(page).to have_content('Hello from London')
    end

    xit 'Can output multiple cities' do
      visit('/')
      fill_in('city', :with => 'London')
      click_button('Submit')
      fill_in('city', :with => 'Barcelona')
      click_button('Submit')
      expect(page).to have_content("Hello from London\nHello from Barcelona")
    end

    scenario 'Can output multiple cities' do
      visit('/')
      fill_in('city', :with => 'London')
      click_button('Submit')
      fill_in('city', :with => 'Barcelona')
      click_button('Submit')
      expect(page).to have_content("Hello from London - Rain \nHello from Barcelona - Clouds")
    end
  end



