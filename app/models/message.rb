# == Schema Information
# Schema version: 2008100601002
#
# Table name: messages
#
#  id          :integer       not null, primary key
#  subject     :string(255)   
#  body        :text          
#  created_at  :datetime      
#  updated_at  :datetime      
#  sender_id   :integer       
#  receiver_id :integer       
#  read        :boolean       not null
#

# == schema info
# schema ver: 
#
# table name: messages
#
#  id          :integer       not null, primary key
#  subject     :string(255)   
#  body        :text          
#  created_at  :datetime      
#  updated_at  :datetime      
#  sender_id   :integer       
#  receiver_id :integer       
#  read        :boolean       not null
#

class Message < ActiveRecord::Base
  belongs_to :sender, :class_name => "Profile"
  belongs_to :receiver, :class_name => "Profile"
  validates_presence_of :body, :subject, :sender, :receiver
  attr_immutable :id, :sender_id, :receiver_id
  
  
  def unread?
    !read
  end
end
