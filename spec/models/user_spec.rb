require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presnece_of :email}
  it { should validate_uniqueness_of :email}
  it { should validate_presnece_of :password}
end
