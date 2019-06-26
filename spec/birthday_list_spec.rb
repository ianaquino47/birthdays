require 'birthday_list'
require 'timecop'

RSpec.describe BirthdayList do
  # add my friends’ birthdays

  it 'adds a birthday' do
    birthday_list = BirthdayList.new

    expect(birthday_list.add('Ian Aquino', '01 June 1994')).to eq [{ name: 'Ian Aquino', birthday: '01 June 1994' }]
  end

  # add two birthdays

  it 'adds two birthdays' do
    birthday_list = BirthdayList.new
    birthday_list.add('Ian Aquino', '01 June 1994')

    expect(birthday_list.add('Jamie Aquino', "14 August 2001")).to eq [{ name: 'Ian Aquino', birthday: '01 June 1994' }, { name: 'Jamie Aquino', birthday: '14 August 2001' }]
  end

  # shows all added names and birthdays

  it 'shows all birthdays' do
    birthday_list = BirthdayList.new
    birthday_list.add('Ian Aquino', '01 June 1994')
    birthday_list.add('Jamie Aquino', "14 August 2001")

    expect { birthday_list.show }.to output("Ian Aquino: 01 June 1994\nJamie Aquino: 14 August 2001\n").to_stdout
  end

  # checks if today is someones birthday

  it 'checks if its someones birthday today' do
    Timecop.freeze(Time.parse('1 June 2019')) do

      birthday_list = BirthdayList.new
      birthday_list.add('Ian Aquino', '01 June 1994')
      birthday_list.add('Jamie Aquino', "14 August 2001")

      expect { birthday_list.check }.to output("It's Ian Aquino's birthday today! They are 25 years old!\n").to_stdout
    end
  end

  it 'checks if its someones birthday today - but theres none' do
    birthday_list = BirthdayList.new
    birthday_list.add('Ian Aquino', '01 June 1994')
    birthday_list.add('Jamie Aquino', "14 August 2001")

    expect { birthday_list.check }.not_to output().to_stdout
  end
end
