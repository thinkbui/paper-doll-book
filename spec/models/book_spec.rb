RSpec.describe Book, type: :model do
	it { is_expected.to validate_presence_of(:name) }

	it { is_expected.to have_many(:pages) }
end