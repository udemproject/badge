class InvitationReferenceCascade < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :invitations, :events
    remove_foreign_key :invitations, :users

    add_foreign_key :invitations, :events, on_delete: :cascade
    add_foreign_key :invitations, :users, on_delete: :cascade
  end
end
