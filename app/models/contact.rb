class Contact < ApplicationRecord
  #Associations
  belongs_to :kind #optional: true
  has_many :phones
  has_one :address

  accepts_nested_attributes_for :phones, allow_destroy:true
  accepts_nested_attributes_for :address

  #def birthdate_br
  #self.birthdate
  #end

  #def author
  #  "Marcus Holanda"
  #end

  #def kind_description
  #  self.kind_description
  #end

  #def as_json(options={})
  #super(
  #root:true,
  #methods: [:kind_description, :author],
  #include: {kind: { only: :description }}
  #)
  #end

end
