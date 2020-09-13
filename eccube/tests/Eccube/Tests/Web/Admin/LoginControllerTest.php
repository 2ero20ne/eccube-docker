<?php

/*
 * This file is part of EC-CUBE
 *
 * Copyright(c) EC-CUBE CO.,LTD. All Rights Reserved.
 *
 * http://www.ec-cube.co.jp/
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace Eccube\Tests\Web\Admin;

use Eccube\Tests\Web\AbstractWebTestCase;

class LoginControllerTest extends AbstractWebTestCase
{
    public function testRoutingAdminLogin()
    {
        $this->client->request('GET', $this->generateUrl('admin_login'));

        // ログイン
        $this->assertEquals(
            200,
            $this->client->getResponse()->getStatusCode()
        );
    }

    public function testRoutingAdminLoginCheck()
    {
        // see https://stackoverflow.com/a/38661340/4956633
        $this->client->request(
            'POST', $this->generateUrl('admin_login'),
            [
                'login_id' => 'admin',
                'password' => 'password',
                '_csrf_token' => 'dummy',
            ]
        );

        $this->assertNotNull($this->container->get('security.token_storage')->getToken(), 'ログインしているかどうか');
    }

    public function testRoutingAdminLogin_ログインしていない場合は401エラーがかえる()
    {
        $this->client->request('GET', $this->generateUrl('admin_homepage'));

        // ログイン
        $this->assertEquals(
            401,
            $this->client->getResponse()->getStatusCode()
        );
    }

    public function testRoutingAdminOauth2Authorize_ログインしていない場合はログイン画面を表示()
    {
        $this->client->request('GET', $this->generateUrl('admin_oauth2_authorize'));

        // ログイン
        $this->assertEquals(
            401,
            $this->client->getResponse()->getStatusCode()
        );
    }

    public function testRoutingOauth2Authorize_ログインしていない場合はログイン画面を表示()
    {
        $this->client->request('GET', $this->generateUrl('oauth2_authorize'));

        // ログイン
        $this->assertEquals(
            401,
            $this->client->getResponse()->getStatusCode()
        );
    }
}
