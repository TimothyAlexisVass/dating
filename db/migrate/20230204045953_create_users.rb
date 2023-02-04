class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :username
      t.string :first_name
      t.string :last_name
      t.date :birth_date
      t.integer :gender
      t.point :location
      t.float :longitude
      t.float :latitude
      t.date :last_active, default: -> { 'CURRENT_TIMESTAMP' }
      t.boolean :verified, default: false
      t.boolean :verified_congregation, default: false
      t.boolean :verified_rebirth, default: false
      t.boolean :is_active, default: false
      t.text :bio
      t.integer :age_range
      t.float :distance_radius, default: 5.0
      t.boolean :limit_contact_to_age_range, default: false
      t.string :relationship_status
      t.string :height
      t.string :body_type
      t.integer :weight
      t.string :eye_color
      t.string :tattoos, array: true, default: []
      t.string :education
      t.integer :income_amount
      t.string :income_currency
      t.string :economy_status
      t.string :work_status
      t.string :attendance_frequency
      t.string :tithing_status
      t.string :alms_status
      t.date :rebirth_date
      t.string :prayer_frequency
      t.integer :number_of_times_read_bible
      t.string :smoke_status
      t.string :sober_status
      t.string :caffeine_status
      t.string :drug_status
      t.string :medical_status
      t.string :diet
      t.string :allergies, array: true, default: []
      t.string :exercise
      t.boolean :children_status
      t.string :wants_children
      t.boolean :pets_status
      t.boolean :wants_pets

      t.index :email, unique: true
      t.index :username, unique: true

      t.timestamps
    end
  end
end
