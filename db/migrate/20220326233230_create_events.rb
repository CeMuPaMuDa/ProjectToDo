class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events, comment: 'Задача(событие)' do |t|
      t.string  :title,
                comment: 'Название задачи'
      t.boolean :done,
                default: false,
                comment: 'Статус завершения'
      t.timestamps
    end
  end
end
