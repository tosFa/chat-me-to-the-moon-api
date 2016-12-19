module SoftDeletable
  def destroy
    self.active = false
    self.save
  end
end
