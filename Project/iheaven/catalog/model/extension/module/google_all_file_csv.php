<?php
    //Devman Extensions - info@devmanextensions.com - 2017-01-20 16:33:18 - Excel library
        require_once DIR_SYSTEM . 'library/Spout/Autoloader/autoload.php';
        use Box\Spout\Reader\ReaderFactory;
        use Box\Spout\Writer\WriterFactory;
        use Box\Spout\Common\Type;
        use Box\Spout\Writer\Style\StyleBuilder;
        use Box\Spout\Writer\Style\Color;
        use Box\Spout\Writer\Style\Border;
        use Box\Spout\Writer\Style\BorderBuilder;
    //END

    class ModelExtensionModuleGoogleAllFileCsv extends ModelExtensionModuleGoogleAllFile {
        public function __construct($registry){
            parent::__construct($registry);
        }
        function create_file() {
            $this->filename = $this->get_filename();
            $this->filename_path = $this->path_tmp.$this->filename;
            $this->writer = WriterFactory::create(Type::CSV);
            $this->writer->openToFile($this->filename_path);
        }
        function insert_columns($columns) {
            foreach ($columns as $key2 => $col) {
                $final_column_names[] = $col['custom_name'];
            }

            $this->writer->addRow($final_column_names);
        }

        function insert_data($feed_elements) {
            $elements = $feed_elements['elements'];
            $columns = $feed_elements['columns'];

            $this->writer->addRow($columns);

            foreach ($elements as $element_id => $element) {
                $this->writer->addRow($element);
            }
            $this->writer->close();
        }
    }
?>