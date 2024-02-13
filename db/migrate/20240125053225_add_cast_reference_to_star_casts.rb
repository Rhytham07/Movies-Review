class AddCastReferenceToStarCasts < ActiveRecord::Migration[7.1]
  def change
    # add_reference :star_casts, :cast, null: false, foreign_key: true
  end
end
