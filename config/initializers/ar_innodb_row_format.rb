if Rails.env.production?

ActiveSupport.on_load :active_record do
  module ActiveRecord::ConnectionAdapters
    class AbstractMysqlAdapter
      def create_table_with_innodb_row_format(table_name, options = {})
        table_options = options.reverse_merge(:options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC')

        create_table_without_innodb_row_format(table_name, table_options) do |td|
         yield td if block_given?
        end
      end
    end
  end
end

end
