class SlugToPublication < ActiveRecord::Migration[5.2]
  def change
    add_column :publications, :uuid, :string, unique: true, index: true
    add_column :publications, :slug, :string, unique: true, index: true

    Publication.all.each do |publication|
      uuid = SecureRandom.uuid
      publication.update_column(:uuid, uuid)
      publication.update_column(:slug, uuid)
    end
  end
end
