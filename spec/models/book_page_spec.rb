RSpec.describe BookPage, type: :model do
	it { is_expected.to validate_presence_of(:name) }
	it { is_expected.to validate_presence_of(:book_id) }

	it { is_expected.to belong_to(:book) }
end