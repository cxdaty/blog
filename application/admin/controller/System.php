<?php
namespace app\admin\controller;

use app\common\controller\AdminBase;
use think\Cache;
use think\Db;

/**
 * 系统配置
 * Class System
 * @package app\admin\controller
 */
class System extends AdminBase {
    public function _initialize() {
        parent::_initialize();
    }

    /**
     * 站点配置
     */
    public function siteConfig() {
        if (Cache::has('site_config')) {
            $site_config = Cache::get('site_config');
        } else {
            $site_config = Db::name('system')->field('value')->where('name', 'site_config')->find();
            $site_config = unserialize($site_config['value']);

        }
    
        return $this->fetch('site_config', ['site_config' => $site_config]);
    }

    /**
     * 提交配置
     */
    public function updateSiteConfig() {
        if ($this->request->isPost()) {
            $site_config   = $this->request->post('site_config/a');
          
            $data['value'] = serialize($site_config);
           
            if (Db::name('system')->where('name', 'site_config')->update($data) !== false) {
                Cache::set('site_config', $site_config);
                $this->success('提交成功');
            } else {
                $this->error('提交失败');
            }
        }
    }
         
    /**
     * 清除缓存
     */
    public function clear() {
        if (delete_dir_file(CACHE_PATH) || delete_dir_file(TEMP_PATH)) {
            $this->success('清除缓存成功');
        } else {
            $this->error('清除缓存失败');
        }
    }
}




