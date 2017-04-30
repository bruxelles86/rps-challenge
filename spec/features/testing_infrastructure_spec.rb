feature 'Offers choice between one or two-player games' do
  scenario 'lets user select one-player game on the start screen' do
    visit('/')
    choose("mode", option: "single_player")
    click_button('Continue')
    expect(page).to have_content 'Single Player Mode'
  end
end

feature 'Lets players choose their names' do
  scenario 'single player\'s name can be entered in form and posted back to server' do
    visit('/')
    choose("mode", option: "single_player")
    click_button('Continue')
    fill_in('player_1', with: 'Will')
    click_button('Let\'s play!')
    expect(page).to have_content 'Will VS Computer'
  end
end

feature 'Computer player plays against the human player' do
  scenario 'computer plays rock, paper or scissors at random' do
    start_single_player
    choose("move", option: "Scissor")
    click_button('Play!')
    expect(page).to have_content 'The computer chose...'
  end
end

# This test passes in isolation, but fails when the above test is run first
feature 'Lets players select a move to play the game' do
  scenario 'player can select rock, paper or scissors in single-player mode' do
    start_single_player
    choose("move", option: "Scissor")
    click_button('Play!')
    expect(page).to have_content 'The computer chose...'
  end
end
