RSpec.describe Layer, type: :model do
	it { is_expected.to validate_presence_of(:name) }
	it { is_expected.to validate_presence_of(:iid) }
	it { is_expected.to validate_presence_of(:book_id) }

	it { is_expected.to belong_to(:book) }
	it { is_expected.to belong_to(:page).optional }
end