require 'rails_helper'

describe Link do
  context 'validations' do
    it { is_expected.to validate_presence_of :url }
    it { is_expected.to validate_uniqueness_of :url }
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_uniqueness_of :title }
  end
end
