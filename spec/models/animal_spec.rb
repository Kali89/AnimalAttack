# == Schema Information
#
# Table name: animals
#
#  id                      :integer          not null, primary key
#  name                    :string(255)
#  blurb                   :string(255)
#  rating                  :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  attachment_file_name    :string(255)
#  attachment_content_type :string(255)
#  attachment_file_size    :integer
#  attachment_updated_at   :datetime
#

require 'spec_helper'

describe Animal do
  pending "add some examples to (or delete) #{__FILE__}"
end
