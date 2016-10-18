# == Schema Information
#
# Table name: administrators
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  phone                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  authentication_token   :string(30)
#

FactoryGirl.define do
  factory :administrator do
    phone "13813813811"
    password "abcd1234"
    authentication_token "qwertyuiop2"
  end
end
